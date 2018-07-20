/* global Vue, VueRouter, axios */

var NewDogPage = {
  template: "#new-dog-page",
  data: function() {
    return {
      name: "",
      breed: "",
      age: "",
      location: "",
      note: "",
      image: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        breed: this.breed,
        age: this.age,
        location: this.location,
        note: this.note,
        image: this.image
      };
      axios.post("/dogs", params).then(function(response) {
        router.push("/");
      }).catch(function(error) {
        this.errors = error.response.data.errors;
      }.bind(this));
    },
    uploadFile: function(event) {
      if (event.target.files.length > 0) {
        var formData = new FormData();
        formData.append("name", this.name);
        formData.append("breed", this.breed);
        formData.append("age", this.age);
        formData.append("location", this.location);
        formData.append("note", this.note);
        formData.append("image", event.target.files[0]);

        axios
          .post("/dogs", formData)
          .then(function(response) {
            router.push("/");
          }.bind(this));
      }
    }
  },
  computed: {}
};

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Rent-A-Dog",
      dogs: []
    };
  },
  created: function() {
    axios.get("/dogs").then(function(response) {
      this.dogs = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      location: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        location: this.location,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/dogs/new", component: NewDogPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});
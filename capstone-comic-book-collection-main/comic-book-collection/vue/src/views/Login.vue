<template>
  <div id="loginPage">
    <div id="bg">
    <div id="login" class="text-center">
      <form class="form-signin" @submit.prevent="login">
        <h1 class="h3 mb-3 font-weight-normal">Log In</h1>
          <div class="input-holder">
            <div
              class="alert alert-danger"
              role="alert"
              v-if="invalidCredentials"
            >Invalid username and password!</div>
            <div
              class="alert alert-success"
              role="alert"
              v-if="this.$route.query.registration"
            >Thank you for registering, please sign in.</div>
            <label for="username" class="sr-only">Username</label>
            <input
              type="text"
              id="username"
              class="form-control"
              placeholder="Username"
              v-model="user.username"
              required
              autofocus
            />
          </div>
          <div class="input-holder">
            <label for="password" class="sr-only">Password</label>
            <input
              type="password"
              id="password"
              class="form-control"
              placeholder="Password"
              v-model="user.password"
              required
            />
          </div>
        <router-link :to="{ name: 'register' }">Need an account? <div id="click-here-to-register">Click here to register!</div></router-link>
        <button type="submit">Login</button>
      </form>
  </div>
  </div>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  created() {
    if (this.$store.state.user.id) {
      this.$router.push({ name: 'collections' })
    }
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push({ name: 'collections' });
            this.$router.go();
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>

<style scoped>
#login {
  position: absolute;
}

  #loginPage {
    width: 100%;
  }

  #bg {
  width: 100vw;
  height: 90vh;
  margin-left: -10%;
  margin-top: -33px;
  position: fixed;
  background-image: url("../../resources/backgrounds/aggron.jpg");
  background-size: cover;
  background-position: 0 18%;
}


 form {
  display: flex;
  gap: 20px;
  flex-direction: column;
  justify-content: space-evenly;
  align-content: center;
  padding: 40px;
  margin: 0 3%;
}
.text-center{
  background-color: #FFFFFF;
  border-radius: 12px;
  box-shadow: 0px 10px 10px rgb(0 0 0 / 20%);
  
  width: 430px;
  height: 530px;
  margin: 0 6%;

  display: flex;
  margin-top: 4%;
}
h1 {
  margin-top: 10px;
}

#click-here-to-register {
  display: inline-block;
  color: var(--site-red)
}
#pokePic{
  display: grid;
  grid-area: pic;
  align-items: center;
  justify-self: center;
  width: 120%;

}

a{
  text-decoration: none;
  color: black;
  font-weight: bold;
}

#password, #confirmPassword{
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  font-size: 0.1ch;
  font-size: 15px;
  color: rgb(117, 166, 223);
}

#password:focus{
  outline: 0;
  box-shadow: 0 0 0 3px #E45052;
}

#username:focus{
  outline: 0;
  box-shadow: 0 0 0 3px #E45052;
}

#confirmPassword:focus{
  outline: 0;
  box-shadow: 0 0 0 3px #E45052;
}
.input-holder {
  display: flex;
  flex-direction: column;
  gap: 5px;
}

@media (max-height: 650px) {
  .text-center{
    align-items: center;
    justify-content: center;
    width: 85%;
    height: 35%;
  }
  form {
    flex-direction: row;
    justify-content: center;
    align-items: center;
  }
}

</style>

<template>
  <div id="loginPage">
    <div id="bg">
    <div id="register" class="text-center">
      <form class="form-register" @submit.prevent="register">
        <h1 class="h3 mb-3 font-weight-normal">Create An Account</h1>
        <div class="input-holder">
          <div class="alert alert-danger" role="alert" v-if="registrationErrors">
            {{ registrationErrorMsg }}
          </div>
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
          <input
            type="password"
            id="confirmPassword"
            class="form-control"
            placeholder="Confirm Password"
            v-model="user.confirmPassword"
            required
          />
        </div>
        <router-link :to="{ name: 'login' }">Have an account? <div id="click-here-to-log-in">Click here to log in!</div></router-link>
        <button class="btn btn-lg btn-primary btn-block" type="submit">
          Register
        </button>
      </form>
    </div>
    </div>
  </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  name: 'register',
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  created() {
    if (this.$store.state.user.id) {
      this.$router.push({ name: 'collections' })
    }
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style scoped>
#loginPage {
  width: 100%;
  height: vh;
  overflow: hidden;
}

#bg {
  width: 100vw;
  height: 90vh;
  margin-left: -10%;
  margin-top: -33px;
  position: fixed;
  background-image: url("../../resources/backgrounds/gardevoir.jpg");
  background-size: cover;
  background-position: 0 18%;
}

form {
  display: flex;
  gap: 20px;
  flex-direction: column;
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
  margin-top: 160px;
}
h1 {
  margin-top: 10px;
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



#click-here-to-log-in {
  display: inline-block;
  color: var(--site-red);
}

.input-holder {
  display: flex;
  flex-direction: column;
  gap: 5px;
}

@media (max-height: 750px) {
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

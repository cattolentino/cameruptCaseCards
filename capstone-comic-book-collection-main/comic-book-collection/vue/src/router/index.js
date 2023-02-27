import Vue from 'vue'
import Router from 'vue-router'
import store from '../store/index'
import Register from '../views/Register.vue'
import Login from '../views/Login.vue'
import Logout from '../views/Logout.vue'
import Collection from '../views/Collection.vue'
import Collections from "../views/Collections.vue"
import Profile from "../views/Profile.vue"
import Friends from "../views/Friends.vue"

Vue.use(Router)

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/logout",
      name: "logout",
      component: Logout,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/collections/:collectionId",
      name: "collection",
      component: Collection,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/collections",
      name: "collections",
      component: Collections,
      meta: {
        requiresAuth: false,
      }
    },
    {
      path: "/profile",
      name: "profile",
      component: Profile,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/profile/:id",
      name: "profileWithId",
      component: Profile,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/friends",
      name: "friends",
      component: Friends,
      meta: {
        requiresAuth: true
      }
    },

  ]
})

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;

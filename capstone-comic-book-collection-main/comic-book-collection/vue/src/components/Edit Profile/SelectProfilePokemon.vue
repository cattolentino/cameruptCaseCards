<template>
<select name="pokemon-rep" v-model="selectedPokemon" @change="changeProfilePokemon">
  <option v-for="pokemon in pokemons" :key="pokemon">{{pokemon}}</option>
</select>
</template>

<script>
export default {
  name: "select-profile-pokemon",
  data() {
    return {
      selectedPokemon: 'Camerupt',
      pokemons: ['Camerupt',
                 'Bulbasaur',
                 'Squirtle',
                 'Charmander',
                 'Pikachu',
                 'Chikorita',
                 'Totodile',
                 'Cyndaquil',
                 'Treecko',
                 'Mudkip',
                 'Torchic']
    }
  },
  created() {
    this.selectedPokemon = this.$store.state.user.profilePokemon;
  },
  methods: {
    changeProfilePokemon() {
      this.$emit('changeProfilePokemon', this.selectedPokemon);
    }
  }
}
</script>
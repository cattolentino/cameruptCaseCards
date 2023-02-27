<template>
    <img :class="{ 'small' : small }" :src="source()" alt="">
</template>

<script>

export default {
    name: "profile-image",
    props: [
        'pokemon',
        'small'
    ],
    methods: {
        source() {
           return require('../../../resources/pokemon/' + this.pokemon.toLowerCase() + '.png')
        }
    },

}
</script>

<style scoped>

img {
    height: 100%;
    width: 100%;
}

.small {
    min-height: 40px;
    min-width: 40px;
    height: 40px;
    width: 40px;
    border-radius: 50%;
    border: 1px solid black;
}

</style>
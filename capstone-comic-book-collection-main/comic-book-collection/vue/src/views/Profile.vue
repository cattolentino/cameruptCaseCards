<template>
    <div>
        <profile-page-background />
        <overlay />
    </div>
</template>

<script>
import ProfilePageBackground from '../components/Edit Profile/ProfilePageBackground.vue';
import Overlay from './../components/Overlay.vue'

export default {
    name: "profile",
    components: {
        ProfilePageBackground,
        Overlay
    },
    data() {
        return {
            editProfile: false,
            cards: []
        }
    }
}

</script>

<style scoped>

</style>
<script setup>

import MovieCard from './MovieCard.vue';

</script>

<template>
    <div class="flex justify-center">
        <div class="film-container flex flex-wrap justify-center max-w-6xl">
            <MovieCard/>
        </div> 
    </div> 
</template>

<style scoped>

.film-container{
    width: 120rem;
}

</style>
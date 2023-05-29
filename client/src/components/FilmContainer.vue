<script>

import MovieCard from './MovieCard.vue';

export default {
  components: {
    MovieCard
  },
  props: ['moviesData']
};


</script>

<template>
    <div class="btn-cotainer inline-felx ml-24">
        <button class="btn-add-movie bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-500 rounded ml-3">Add Movie</button>
    </div>
    <div class="flex justify-center">
        <div class="film-container flex flex-wrap justify-center max-w-6xl">
            <MovieCard :moviesData="moviesData"/>
        </div> 
    </div> 
</template>

<style scoped>

.film-container{
    width: 120rem;
}

</style>
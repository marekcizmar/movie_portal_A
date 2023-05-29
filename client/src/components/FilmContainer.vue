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
        <button class="btn-add-movie bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-700 rounded">Add Movie</button>
        <button class="btn-remove-movie bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-700 rounded">Remove Movie</button>
        <button class="btn-update-movie bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-700 rounded">Update Movie</button>
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
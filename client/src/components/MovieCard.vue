<script>

import MovieItem from './MovieItem.vue';

export default {
  props:['moviesGeners', 'moviesData','viewMoreBooleanOnOff'],
    components: {
        MovieItem,
    },
};

</script>

<template>
    <div class="movie-container m-4" v-for="movie of moviesData" :key="movie.id">
      <MovieItem :movie="movie" :moviesGeners="moviesGeners" :viewMoreBooleanOnOff="viewMoreBooleanOnOff"/> 
    </div>
</template>
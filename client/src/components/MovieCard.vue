<script>

import MovieItem from './MovieItem.vue';

export default {
    
    data(){
        return{
            moviesData: [],

            showModal: false,
            selectedGenre: 0,
            title: '',
            releaseDate: 2015,
            summary: '',
            image: '',
            quality: '',
            length: 0,
            trailer:'',
            viewed:0,
            rated:0
        }
    },
    props: ['moviesGeners'],
    methods: {
        async getData(){
            const res = await fetch('http://localhost:5000/movie')
            const finalRes = await res.json()
            this.moviesData = finalRes
            
        },
        async deleteFilm(movie) {
    try {
      const response = await fetch(`http://localhost:5000/movie/${movie.id}`, {
        method: 'DELETE'
      });
      if (response.ok) {
        
        this.moviesData = this.moviesData.filter((m) => m.id !== movie.id);
      } else {
       
        console.error('Failed to delete film');
      }
    } catch (error) {
      console.error('An error occurred:', error);
    }
    },
    
    updateMoviesOnOff(){
        this.showModal = !this.showModal;
    },
  updateMoviesData(updatedMoviesData) {
      this.moviesData = updatedMoviesData;
    }
    },
    mounted(){
        this.getData()
    },
    components: {
        MovieItem,
    },
};

</script>

<template>
    <div class="movie-container m-4" v-for="movie of moviesData" :key="movie.id">
    <MovieItem :movie="movie" :moviesGeners="moviesGeners"/> 
  </div>
</template>
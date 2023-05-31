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
<<<<<<< HEAD
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
        updateMoviesData(updatedMoviesData) {
            this.moviesData = updatedMoviesData;
            }
            },
            mounted(){
                this.getData()
            },
            watch: {
                moviesData(newValue){
                    console.log(newValue);
                },
            }
  
=======
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
>>>>>>> 60f28785efe302bf48d452f2870be932361337be
};

</script>

<template>
<<<<<<< HEAD
    <div class="m-4" v-for="movie of moviesData" >
        <div class="relative">
            <a href="" class=""><img class="shadow-lg w-48 h-72 hover:opacity-50 transition duration-150 ease-in-out" :src="movie.image" alt=""></a>
            <div class="absolute top-0 h-full w-full opacity-0 bg-blue-900 hover:opacity-100 transition duration-300 ease-in-out px-5 text-center text-white text-sm ">
                <p class="mt-8">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Inventore in, itaque nulla temporibus voluptas saepe porro.</p>
                <a href="" class=""><p class="mt-20 py-2 rounded-md bg-blue-400 hover:bg-blue-300 hover:shadow-2xl hover:shadow-blue-100 transition duration-150 ease-in-out">View more</p></a>
            </div>
        </div>
        <span class="movie-footer mt-3 flex justify-center gap-8">
            <div class="movie-relese-date self-end ">
                {{ movie.year }}
            </div>

            <div class="movie-length table-cell self-end">
                {{ movie.length }}min
            </div>

            <div class="movie-resolution table-cell self-end">
                {{ movie.quality }}
            </div> 
        </span>
        <span class="btn-container inline-flex w-48 justify-between" >
            <button class="btn-remove-movie bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-500 rounded" @click="deleteFilm(movie)">Remove</button>
            <button class="btn-update-movie bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-500 rounded">Update</button>
        </span>
    </div>
=======
    <div class="movie-container m-4" v-for="movie of moviesData" :key="movie.id">
    <MovieItem :movie="movie" :moviesGeners="moviesGeners"/> 
  </div>
>>>>>>> 60f28785efe302bf48d452f2870be932361337be
</template>
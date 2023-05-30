<script>

export default {
    data(){
        return{
            moviesData: []
        }
    },
    methods: {
        async getData(){
            const res = await fetch('http://localhost:5000/movie')
            const finalRes = await res.json()
            this.moviesData = finalRes
            console.log(finalRes)
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
  }
    },
    mounted(){
        this.getData()
    },
  
};

</script>

<template>
    <div class="movie-container m-4" v-for="movie of moviesData" >
        <div class="bg-blue-400">
            <a href=""><img class="shadow-lg w-48 h-72 hover:opacity-50 transition duration-150 ease-in-out" :src="movie.image" alt=""></a>
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
</template>
<script>

export default {
    
    data(){
        return{
            movie: {},
            showModal: false,
            selectedGenre: this.movie.genre,
            id:this.movie.id,
            title: this.movie.title,
            releaseDate: this.movie.year,
            summary: this.movie.summary,
            image: this.movie.image,
            quality: this.movie.quality,
            length: this.movie.length,
            trailer:this.movie.trailer,
            viewed:this.movie.viewed,
            rated:this.movie.rated,
            showSumaty:false,
        }
    },
    props: ['moviesGeners','movie', 'viewMoreBooleanOnOff'],
    methods: {
        async getData(){
            const res = await fetch('http://localhost:5000/movie')
            const finalRes = await res.json()
            this.moviesData = finalRes
            //console.log(finalRes)
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
    window.location.reload()
    },
    updateMovie() {
        this.showModal = !this.showModal;
            const movieData = {
                id:this.id,
                title: this.title,
                year: this.releaseDate,
                genre: this.selectedGenre,
                summary: this.summary,
                image: this.image,
                quality: this.quality,
                length: this.length,
                trailer:this.trailer,
                viewed:0,
                rated:0
            };
            
            fetch('http://localhost:5000/movie', {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(movieData)
            })
                .then(response => {
                    if (response.ok) {
                        location.reload();
                    } else {
                        console.error('Error adding movie:', response.statusText);
                    }
                })
                .catch(error => {
                    console.error('Error adding movie:', error);
                });
    },
    OnOffSumaty(){
        this.showSumaty=!this.showSumaty
    },
    updateMoviesOnOff(){
        this.showModal = !this.showModal;
    },
    updateMoviesData(updatedMoviesData) {
      this.moviesData = updatedMoviesData;
    },
    },
    mounted(){
        this.getData()
    },
      
};

</script>

<template>
    <div v-if="!showModal">
        <div class="relative">
            <a href="" class=""><img class="shadow-lg w-48 h-72 hover:opacity-50 transition duration-150 ease-in-out" :src="movie.image" alt=""></a>
            <div class="absolute h-72 top-0 opacity-0 bg-blue-900 hover:opacity-100 transition duration-300 ease-in-out px-5 text-center text-white text-sm ">
                <div class="relative h-60">
                    <p class="my-6 hover:cursor-default">{{ (movie.summary).slice(0, 120) }}...</p>
                    <button @click="OnOffSumaty()" class="absolute bottom-0 right-0 left-0 text-center py-2 rounded-md bg-blue-400 hover:bg-blue-300 hover:shadow-2xl hover:shadow-blue-100 transition duration-150 ease-in-out">View more</button>
                </div>
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
        </div>

        <div v-if="showModal" class="bg-slate-100 container mx-auto shadow-2xl">
            <div class="flex flex-col justify-center mx-10">
                <label class="mt-5">Film title</label>
                <input type="text" v-model="title" id="title" class="mt-4 py-2 px-4 border border-slate-400 rounded" placeholder="Type in a movie name">

                <label class="mt-5">Relese date</label>
                <input type="number" v-model="releaseDate" class="mt-4 py-2 px-4 border border-slate-400 rounded">

                <label class="mt-5">Genre</label>
                <form action="" class="">
                <select v-model="selectedGenre" id="genres" class="mt-4 py-2 px-4 border border-slate-400 rounded w-full">
                        <option v-for="genre in moviesGeners" :value="genre.id" :key="genre.id">{{ genre.title }}</option>
                    </select>
                </form>

                <label class="mt-5">Summary</label>
                <input type="text" v-model="summary" class="mt-4 py-2 px-4 border border-slate-400 rounded" placeholder="Type in a brief summary">

                <label class="mt-5">Poster</label>
                <input type="url" v-model="image" class="mt-4 py-2 px-4 border border-slate-400 rounded" placeholder="URL">

                <label class="mt-5">Quality</label>
                <input type="text"  v-model="quality" class="mt-4 py-2 px-4 border border-slate-400 rounded" placeholder="HD | FHD | 4K">

                <label class="mt-5">Length (min)</label>
                <input type="number" v-model="length" class="mt-4 py-2 px-4 border border-slate-400 rounded">

                <label class="mt-5">Trailer</label>
                <input type="url" v-model="trailer" class="mt-4 py-2 px-4 border border-slate-400 rounded" placeholder="URL">
                
                <div class="my-6 text-center">
                    <button class="px-4 py-3 bg-red-400 border border-red-600 hover:bg-red-300 hover:shadow-lg rounded-md transition duration-150 ease-in-out text-white mr-5" @click="updateMoviesOnOff()">Cancel</button>
                    <button  class="px-6 py-3 bg-green-400 border border-green-600 hover:bg-green-300 hover:shadow-lg rounded-md transition duration-150 ease-in-out text-white" @click="updateMovie()">Save</button>
                </div>
            </div>
        </div>
        
        <span class="btn-container inline-flex w-48 justify-between" >
            <button v-if="!showModal" class="btn-remove-movie bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-500 rounded" @click="deleteFilm(movie)">Remove</button>
            <button v-if="!showModal" class="btn-update-movie bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-500 rounded" @click="updateMoviesOnOff()">Update</button>            
        </span>
        <div v-if="showSumaty" class="absolute top-0 left-0 w-full h-[400rem] bg-black z-[900000] fixt justify-center opacity-50	 text-white">
            {{movie.summary}}
        </div>
</template>

<!-- /* .container {
    position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5); 
  z-index: 9999; 
  display: flex;
  justify-content: center;
  align-items: center;
  color: #fff; 
  
} */ -->



<script>

import MovieCard from './MovieCard.vue';

export default {
    data() {
        return {
           
            showModal: false,
            selectedGenre: 0,
            title: '',
            releaseDate: 2015,
            summary: '',
            image: '',
            quality: '',
            length: 100
        };
    },
    components: {
        MovieCard
    },
    props: ['moviesGeners', 'moviesData'],
    methods: {
        async getData(){
            const res = await fetch('http://localhost:5000/movie')
            const finalRes = await res.json()
            this.$emit('update:moviesData', finalRes);
            //console.log(finalRes)
        },
        handleOnOffMovie() {
            this.showModal = !this.showModal;
        },
        async handleAddMovie() {
            this.showModal = !this.showModal;
            const movieData = {
                title: this.title,
                year: this.releaseDate,
                genre: this.selectedGenre,
                summary: this.summary,
                image: this.image,
                quality: this.quality,
                length: this.length
            };
            
            fetch('http://localhost:5000/movie', {
                method: 'POST',
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
        }
    },
    mounted(){
        this.getData()
    },
    watch: {
        selectedGenre(newValue) {
            console.log(newValue);
        },
        moviesData(newValue){ 
            //console.log(newValue);
        },
    }
};
//title, year, genre, summary, image,quality,"length"

</script>

<template>
    <div v-if="showModal" class="modal">
        <div>
            <label class="flex-row flex mx-24 justify-between">Film title</label><br>
            <input type="text" v-model="title" id="title" class="btn-add-movie bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-500 rounded ml-3 m-3"><br>

            <label class="flex-row flex mx-24 justify-between">Relese date</label><br>
            <input type="number" v-model="releaseDate" class="btn-add-movie bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-500 rounded ml-3 m-3"><br>

            <label class="flex-row flex mx-24 justify-between">Genre</label><br>
            <form action="" class="flex-row flex mx-10 justify-between">
               <select v-model="selectedGenre" id="genres" class="cursor-pointer hover:bg-slate-100 transition h-10 w-32 rounded-md m-5 text-slate-500 text-left border-none shadow-xl outline-none flex-row">
                    <option v-for="genre in moviesGeners" :value="genre.id" :key="genre.id">{{ genre.title }}</option>
                </select>
            </form><br>

            <label class="flex-row flex mx-24 justify-between">Summary</label><br>
            <input type="text" v-model="summary" class="btn-add-movie bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-500 rounded ml-3 m-3"><br>

            <label class="flex-row flex mx-24 justify-between">Poster</label><br>
            <input type="url" v-model="image" class="btn-add-movie bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-500 rounded ml-3 m-3"><br>

            <label class="flex-row flex mx-24 justify-between">Quality</label><br>
            <input type="text"  v-model="quality" class="btn-add-movie bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-500 rounded ml-3 m-3"><br>

            <label class="flex-row flex mx-24 justify-between">Lenght</label><br>
            <input type="number" v-model="length" class="btn-add-movie bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-500 rounded ml-3 m-3"><br>
            
            <button  class="btn-add-movie bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-500 rounded ml-3" @click="handleAddMovie">Submit</button>
        </div>
    </div>

    <div class="btn-cotainer inline-felx ml-24">
        <button v-if="!showModal" class="btn-add-movie bg-blue-400 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-500 rounded ml-3" @click="handleOnOffMovie">Add Movie</button>
    </div>
    
    <div class="flex justify-center">
        <div class="film-container flex flex-wrap justify-center max-w-6xl" onsubmit="setTimeout(function(){window.location.reload();},10);">
            <MovieCard :moviesData="moviesData"/>
        </div> 
    </div> 
</template>

<style scoped>

.film-container{
    width: 120rem;
}

</style>
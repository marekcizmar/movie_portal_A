<script>
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
            length: 0,
            trailer:'',
            viewed:0,
            rated:0,
        };
    },
    
    props: ['moviesGeners', 'moviesData','handleOnOffMovie','modal','handleAddMovie'],
    methods: { 
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
</script>

<template>
    <div class="">
        <div v-if="modal()" class="bg-slate-100 container mx-auto shadow-2xl">
            <div class="flex flex-col justify-center  mx-10">
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
                    <button class="px-4 py-3 bg-red-400 border border-red-600 hover:bg-red-300 hover:shadow-lg rounded-md transition duration-150 ease-in-out text-white mr-5" @click="handleOnOffMovie">Cancel</button>
                    <button  class="px-6 py-3 bg-green-400 border border-green-600 hover:bg-green-300 hover:shadow-lg rounded-md transition duration-150 ease-in-out text-white" @click="handleAddMovie">Save</button>
                </div>
            </div>
        </div>
    </div>
        
    <div class="">
        <button v-if="!modal()" class="px-6 py-3 bg-green-400 border border-green-600 hover:bg-green-300 hover:shadow-lg rounded-md transition duration-150 ease-in-out text-white" @click="handleOnOffMovie">Add Movie</button>
    </div>
</template>
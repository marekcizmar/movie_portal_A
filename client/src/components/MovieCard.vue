<script>

export default {
    data(){
        return{
            moviesData: []
        }
    },
    methods: {
        async getData(){
            const res = await fetch('http://localhost:5000/')
            const finalRes = await res.json()
            this.moviesData = finalRes
            console.log(finalRes)
        }
    },
    mounted(){
        this.getData()
    }
}


</script>

<template>
    <div class="movie-container w-48 h-80 m-4" v-for="movie of moviesData" >

        <span class="movie-preview h-64">
            <img class="shadow-lg" :src="movie.image" alt="">
        </span>

        <span class="movie-footer w-48 h-9 flex flex-nowrap justify-center gap-8">
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
</template>
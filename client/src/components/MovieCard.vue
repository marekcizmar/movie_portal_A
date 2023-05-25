<script>

import { moviesData } from '../composable/data'

export default {
    data(){
        return{
            moviesData
        }
    }
}

console.log(moviesData)

</script>

<template>
    <div class="movie-container w-48 h-80 m-4" v-for="movie of moviesData.list" >

        <span class="movie-preview h-64">
            <img class="shadow-lg" :src="movie.movieURL" alt="">
        </span>

        <span class="movie-footer w-48 h-9 flex flex-nowrap justify-center gap-8">
                <div class="movie-relese-date self-end ">
                    {{ movie.releseDate }}
                </div>

                <div class="movie-length table-cell self-end">
                    {{ movie.movieLength }}min
                </div>

                <div class="movie-resolution table-cell self-end">
                    {{ movie.movieResolution }}
                </div> 
        </span>
    </div>
</template>
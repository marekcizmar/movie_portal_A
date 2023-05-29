<script>

export default{
    props: ['moviesData'],
};

</script>

<template>
    <div class="movie-container m-4" v-for="movie of moviesData" >
        <img class="shadow-lg w-48 h-72" :src="movie.image" alt="">
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
</template>
<script>

export default{
    props: ['moviesGeners'],
};

</script>

<template>
  <div class="container mx-auto mt-24">
    <div class=" flex justify-center">
      <input type="text" placeholder="Search for a movie..." class="border border-slate-400 rounded-l-xl p-5 w-full">
      <button type="submit" class=" bg-blue-400 px-16 rounded-r-xl">
        <i class="fa fa-search text-white fa-lg"></i>   
      </button>
    </div>
    <form action="" class="flex-row flex mx-24 justify-between">
      <select  id="genres" class="cursor-pointer hover:bg-slate-100 transition h-10 w-32 rounded-md m-10 text-slate-500 text-left border-none shadow-xl outline-none flex-row">
        <option value="0">Main</option>
        <option  v-for="genre in moviesGeners" value="@{{ genre.id }}">{{ genre.title }}</option>
      </select>
      <div class="slidecontainer">
        <p class="absolute py-11 text-slate-400 ">Year:</p>
        <input type="range" min="2015" max="2018" value="2015" class="slider absolute m-12 w-40" id="myRange">
        <input type="range" min="2015" max="2018" value="2018" class="slider relative m-12 w-40" id="myRange2">
        <br>
        <p class="absolute px-10 -my-10 text-slate-400">2015</p>
        <p class="absolute px-44 -my-10 text-slate-400 ">2018</p>
      </div>
    </form>
  </div>
</template>
<script>
export default {
  data() {
    return {
      moviesGeners: [],
    };
  },
  methods: {
    async getDataGeners() {
      const res = await fetch('http://localhost:5000/genre');
      const finalRes = await res.json();
      this.moviesGeners = finalRes;
      console.log(finalRes);
    },
  },
  mounted() {
    this.getDataGeners();
  },
}

</script>

<template class="flex-row flex">
  <div class="search-bar-container flex justify-center mt-24 mx-24">
    <input type="text" placeholder="Search for a movie..." class="border border-slate-400 rounded-l-xl p-5 w-full">
    <button type="submit" class="bg-blue-400 px-16 rounded-r-xl">
      <i class="fa fa-search text-white fa-lg"></i>
    </button>
  </div>
  <form action="" class="flex-row flex mx-24 justify-between relative top-3">
    <select id="genres" class="
      cursor-pointer
      hover:bg-slate-100
      transition
      h-10
      w-32 
      rounded-md  
      m-10
      text-slate-500
      text-left
      border-none
      shadow-xl
      outline-none 
      flex-row 
    ">
      <option value="0">Main</option>
      <option v-for="genre in moviesGeners" :value="genre.id">{{ genre.title }}</option>
    </select>


  <select id="YearsFrom" class="
      cursor-pointer
      hover:bg-slate-100
      transition
      h-10
      w-32 
      rounded-md  
      m-10
      text-slate-500
      text-center
      border-none
      shadow-xl
      outline-none 
      flex-row
      justify-between
      relative
      left-[650px]
      ">
    <option value="0">FROM: 2015</option>
  </select>

  <select id="YearsTo" class="
      cursor-pointer
      hover:bg-slate-100
      transition
      h-10
      w-32 
      rounded-md  
      m-10
      text-slate-500
      text-center
      border-none
      shadow-xl
      outline-none 
      flex-row
      ">
      <option value="0">TO: 2022</option></select>
      </form>
</template> 


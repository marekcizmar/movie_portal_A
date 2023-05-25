<template>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <div class="">
        <form action="" class="flex-row flex m-10 shadow-xl rounded ">
        <input for="large-input" type="search" placeholder="Search for a movie..."  
        class="
        container 
        h-12 
        cursor-text 
        border-none 
        hover:bg-slate-50 
        transition 
        duration-200 
        rounded-l 
        placeholder-slate-300 
        outline-none 
        object-left
        text-left
        p-5    
        flex">

<button type="submit" class=" 
bg-blue-400 
hover:bg-blue-500 
transition 
border-solid 
border-zinc-100 
cursor-pointer
h-12 w-24 
inline 
rounded-r
hover:w-30
">
<i class="fa fa-search text-white"></i>   
</button>
</form>
<form action="" class="flex-row flex ">
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
  <option selected class="">Genre</option>
  <option value="1">Comedy</option>
  
</select>
<div class="slidecontainer">
  <input type="range" min="2015" max="2018" value="2015" class="slider m-12" id="myRange">
</div>
</form>
    </div>
</template>
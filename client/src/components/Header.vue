<template>
    <div class="shadow-lg">
        <nav class="container mx-auto p-5">
            <main class="flex justify-between">
                <div class="flex content-center">
                    <i class="fa fa-film text-5xl text-blue-400"></i>
                    <h1 class="text-xl py-2-5 px-1 text-blue-900 pl-4 font-medium"><a href="">FilmFusion</a></h1>
                    <div class="border-left-1 ml-10 mr-10 py-2 px-1"></div>
                    <h1 class="nav_a animation"><a href="" class="px-4">Home</a></h1>
                    <h1 class="nav_a animation"><a href="" class="px-4">Movies</a></h1>
                    <h1 class="nav_a animation"><a href="" class="px-4">Genres</a></h1>
                </div>
                <div>
                    <input type="text" placeholder="Quick search" class="border border-slate-400 rounded-l-xl p-2 pr-16">
                    <button class="bg-blue-400 border border-blue-400 hover:bg-blue-300 hover:border-blue-300 transition duration-150 ease-in-out rounded-r-xl py-2 px-12 mr-14">
                        <i class="fa-solid fa-magnifying-glass" style="color: white"></i>
                    </button>
                    <button class="text-slate-500 hover:bg-slate-50 hover:text-blue-500 rounded-xl p-3 transition duration-150 ease-in-out"><i class="fa-solid fa-moon fa-xl"></i></button>
                </div>
            </main>
        </nav>
    </div>
</template>
<template>
  <div v-if="showCookieBanner" id="CookieBanner" class="fixed w-full h-28 bg-blue-400 shadow-current -bottom-1 m-0 z-10 shadow-2xl">
      <p class="relative top-8 left-12 text-slate-100"> This website collects cookies to deliver better user experience. 
      We collect cookies to analyze our website traffic and performance; we never collect any personal data.<br> 
      Cookies help us display personalized product recommendations and ensure you have great watching experience.</p> 
       
<form action="" class="text-right"> 
<button @click="hideCookieBanner" class="relative -top-4 -left-20 h-12 w-28 shadow-xl bg-white rounded-lg text-blue-800 hover:bg-gray-100 transition duration-150 ease-in-out">Accept</button>
<button @click="hideCookieBanner" class="relative -top-4 -left-14 h-12 w-28 shadow-xl bg-gray-200 rounded-lg text-blue-800 hover:bg-gray-50 transition duration-150 ease-in-out">Reject</button>
</form> 
</div> 
</template>

<script>

export default {
  data() {
    return {
      showCookieBanner: false,
    };
  },
  mounted() {
    if (!localStorage.getItem('cookieConsent')) {
      this.showCookieBanner = true;
    }
  },
  methods: {
    hideCookieBanner() {
      this.showCookieBanner = false;
      localStorage.setItem('cookieConsent', 'true');
    },
  },
};
</script>
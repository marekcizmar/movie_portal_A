import { Module } from '@nuxt/types';

interface ModuleOptions {
    path: string;
    fileName: string;
    keepDefaultRouter?: boolean;
    parsePages?: boolean;
}
declare const CONFIG_KEY = "routerModule";
declare const nuxtModule: Module<ModuleOptions>;
declare module '@nuxt/types' {
    interface NuxtConfig {
        [CONFIG_KEY]?: ModuleOptions;
    }
    interface Configuration {
        [CONFIG_KEY]?: ModuleOptions;
    }
}

export default nuxtModule;
export { ModuleOptions };

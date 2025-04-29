import { defineConfig } from "vite";
import react from "@vitejs/plugin-react-swc";

export default defineConfig({
  plugins: [react()],
  server: {
    port: process.env.FRONTEND_PORT,
    proxy: {
      '/api': {
        target: 'http://54.91.92.175:5000', // For local development
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\/api/, '')
      }
    }
  }
})
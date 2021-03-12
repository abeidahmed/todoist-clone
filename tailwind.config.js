module.exports = {
  purge: ["./app/views/**/*.html.erb"],
  darkMode: false,
  theme: {
    extend: {},
  },
  variants: {
    extend: {
      colors: {
        brand: {
          DEFAULT: "#db4c3f",
          600: "#c53727",
        },
      },
    },
  },
  plugins: [require("@tailwindcss/forms")],
};

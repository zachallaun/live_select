// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration
module.exports = {
    content: [
        './js/**/*.js',
        '../config/*.exs',
        '../lib/support/*_web.ex',
        '../lib/support/*_web/**/*.*ex',
        '../lib/live_select/*.*ex'
    ],
    theme: {
        extend: {},
    },
    plugins: [
        require("daisyui"),
        require('@tailwindcss/typography'),
        require('@tailwindcss/forms')
    ]
}

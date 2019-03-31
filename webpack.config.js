const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

module.exports={
    entry:'./src/js/index.js',
    output:{
        path: path.resolve(__dirname, './dist'),
        filename: 'js/bundle.js'
    },
    devServer:{
        port: 5000
    },
    module:{
        rules:[
            {
                test: /\.(sa|sc|c)ss$/,
                use: [
                    MiniCssExtractPlugin.loader,
                    'css-loader',
                    'sass-loader'
                ]
            },
            {
                test: /\.m?js$/,
                exclude: /(node_modules|bower_components)/,
                use: {
                  loader: 'babel-loader',
                  options: {
                    presets: ['@babel/preset-env']
                  }
                }
              }
        ]
    },
    plugins: [
        new HtmlWebpackPlugin({
            template: './src/index.html',
            title: 'simple base structure',
            filename: 'index.html',
            meta: {
                author: 'Giovanny Garzon'
            },
            minify:{
                collapseWhitespace: true,
                removeComments: true,
                removeRedundantAttributes: true,
                removeScriptTypeAttributes: true,
                removeStyleLinkTypeAttributes: true,
                useShortDoctype: true
            }
        }),
        new MiniCssExtractPlugin({
            filename: 'css/bundle.css'
        })
    ]
}
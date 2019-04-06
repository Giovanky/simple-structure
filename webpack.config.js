const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const CleanWebpackPlugin = require('clean-webpack-plugin');
const autoprefixer = require('autoprefixer');

module.exports={
    entry: './src/js/index.js',
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
                test: /\.js$/,
                exclude: /node_modules/,
                use: {
                  loader: 'babel-loader',
                }
            },
            {
                test: /\.html$/,
                use: [
                  {
                    loader: 'html-loader',
                    options: { minimize: true }
                  }
                ]
            },
            {
                test: /\.(sa|sc|c)ss$/,
                use: [
                    MiniCssExtractPlugin.loader,
                    'css-loader',
                    'sass-loader'
                ]
            },
            {
                test: /\.(jpe?g|png|gif|svg|webp)$/i,
                use: [
                  'file-loader?name=assets/[name].[ext]',
                  'image-webpack-loader?bypassOnDebug'
                ]
            },
            {
                test: /\.(ttf|eot|woff2?|mp4|mp3|txt|xml|pdf)$/i,
                use: 'file-loader?name=assets/[name].[ext]'
            }
        ]
    },
    plugins: [
        new CleanWebpackPlugin(['dist/**/*.*']),
        new HtmlWebpackPlugin({
            template: './src/index.html',
            title: 'a simple structure',
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
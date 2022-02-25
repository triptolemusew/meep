const path = require("path");

const HtmlWebpackPlugin = require("html-webpack-plugin");

module.exports = {
  mode: "development",
  entry: "./main.js",
  output: {
    path: path.resolve(__dirname, "build"),
    filename: "[name].[contenthash].js",
    publicPath: "/",
  },
  devServer: {
    host: "0.0.0.0",
    port: 8080,
    open: true,
    hot: true,
    historyApiFallback: true,
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: [/webpack.config.js/, /build/, /assets/],
        loader: "esbuild-loader",
        options: {
          loader: "jsx",
          target: "es2015",
        },
      },
      {
        test: /\.css$/i,
        use: [
          "style-loader",
          "css-loader",
          {
            loader: "esbuild-loader",
            options: {
              loader: "css",
              minify: true,
            },
          },
        ],
      },
      {
        test: /\.(jpg|png)$/,
        type: "asset/resource",
      },
      {
        test: /\.svg$/,
        type: "asset/inline",
      },
    ],
  },
  plugins: [
    new HtmlWebpackPlugin({
      title: "Meep",
      filename: "index.html",
      template: path.resolve(__dirname, "main.ejs"),
    }),
  ],
};

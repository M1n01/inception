# sample dockerfile for nginx
FROM nginx:alpine
COPY ./conf/nginx.conf /etc/nginx/conf
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]

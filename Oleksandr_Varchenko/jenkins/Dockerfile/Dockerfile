# STEP 1
FROM node:lts AS builder
# Create build directory
RUN mkdir /build-dir
# Add site files in build directory.
ADD ./site-src/ /build-dir
# Building files
RUN cd /build-dir && \
    echo "----=== npm install ===----" && \
    npm install && \
    echo "----=== npm run build ===----" && \
    npm run build

# STEP 2
FROM nginx:alpine AS prod
# Copy the build files
COPY --from=builder /build-dir/dist /usr/share/nginx/html


FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    libasio-dev \
    libssl-dev \
    git \
    wget

# Set working directory
WORKDIR /app

# Copy all project files
COPY . .

# Build the app
RUN rm -rf build && mkdir build && cd build && \
    cmake .. && \
    make

# Expose port
EXPOSE 18080

# Run the app
CMD ["./build/trading_app"]


# FROM ubuntu:latest

# # Install dependencies
# RUN apt-get update && apt-get install -y \
#     build-essential \
#     cmake \
#     libasio-dev \
#     libssl-dev \
#     git \
#     wget \
#     curl \
#     pkg-config

# # Set working directory
# WORKDIR /app

# # Copy all project files
# COPY . .

# # Create build directory and compile the app
# RUN mkdir -p build && cd build && \
#     cmake .. && \
#     make

# # Expose port used by the app
# EXPOSE 18080

# # Run the app
# CMD ["./build/trading_app"]

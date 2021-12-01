FROM nvidia/cuda:11.3.0-devel-ubuntu18.04

ENV BLENDER_MAJOR 2.92
ENV BLENDER_VERSION 2.92.0
ENV BLENDER_TAR_URL https://download.blender.org/release/Blender${BLENDER_MAJOR}/blender-${BLENDER_VERSION}-linux64.tar.xz

RUN apt-get update && \
	apt-get install -y \
		curl wget nano \
		bzip2 libfreetype6 libgl1-mesa-dev \
		libglu1-mesa \
		libxi6 libxrender1 && \
	apt-get -y autoremove

# Install blender
RUN mkdir /usr/local/blender && \
	wget --quiet ${BLENDER_TAR_URL} -O blender.tar.xz && \
	tar -xvf blender.tar.xz -C /usr/local/blender --strip-components=1 && \
	rm blender.tar.xz

# Set blender alias
RUN ln -s /usr/local/blender/blender /usr/bin/blender

# Copy files to be used for rendering
COPY render_blender.py /home/
COPY scripts/image_rendering.sh /home/
RUN chmod +x /home/image_rendering.sh
WORKDIR /home/
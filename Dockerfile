FROM biocontainers/biocontainers:v1.0.0_cv4

MAINTAINER William Poehlman <william.poehlman@sagebase.org>
LABEL base_image="biocontainers/biocontainers:v1.0.0_cv4"
LABEL about.summary="Docker image for template dockstore tool"
LABEL about.license="SPDX:MIT"


USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    tzdata

RUN export SOFTWARE_VERSION='2.2.4' && \
  wget https://github.com/broadinstitute/picard/releases/download/${SOFTWARE_VERSION}/picard-tools-${SOFTWARE_VERSION}.zip && \
  unzip -q picard-tools-${SOFTWARE_VERSION}.zip && \
  rm picard-tools-${SOFTWARE_VERSION}.zip && \
  mv picard-tools-${SOFTWARE_VERSION} /usr/local/lib/

ENV JAR_DIR /usr/local/lib/picard-tools-2.2.4

ENV CONDA_PACKAGES \
  python=2.7 \
  ucsc-gtftogenepred \
  samtools \
  r=3.4.1 \
  r-tidyr \
  r-readr \
  r-stringr \
  r-purrr \
  r-dplyr \
  r-argparse

RUN conda install ${CONDA_PACKAGES}
RUN conda install -c conda-forge ncurses

COPY bin/* /usr/local/bin/
RUN chmod a+x /usr/local/bin/combine_metrics_sample.py
RUN chmod a+x /usr/local/bin/combine_metrics_study.R
RUN chmod a+x /usr/local/bin/make_refflat.sh
RUN chmod a+x /usr/local/bin/make_riboints.sh
RUN chmod a+x /usr/local/bin/picard.sh
RUN sed -i s/Xmx1g/Xmx50g/ /usr/local/bin/picard.sh
CMD ["/bin/bash"]


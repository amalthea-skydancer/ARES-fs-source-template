#!/usr/bin/env bash

# function to generate index.html for the given directory
generateIndex() {
	echo "" >"$1/index.html" # clear out any existing indexes
	for file in "$1"/*; do
		if [[ ${file##*/} == "index.html" ]]; then
			continue
		fi
		if [[ ! -d ${file} ]]; then
			echo "Processing ${file}"
			echo -n "${file##*/} " >>"$1/index.html"
			stat -c %s "${file}" >>"$1/index.html"
		fi
	done
}

# generate index.html for personas
generateIndex personas


sed -i "s#<!-- URL -->#$url#g" index.html
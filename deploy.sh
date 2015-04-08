find _site/ -type f -name '*.html' -exec gzip -9 "{}" \; -exec mv {}.gz {} \;
find _site/ -type f -name '*.css' -exec gzip -9 "{}" \; -exec mv {}.gz {} \;
find _site/ -type f -name '*.js' -exec gzip -9 "{}" \; -exec mv {}.gz {} \;
s3cmd sync --guess-mime-type --delete-removed --add-header="Cache-Control:max-age=7200" --recursive --exclude '*.html' --exclude '*.css' --exclude '*.js' --exclude '*.xml' _site/* s3://www.garron.me
s3cmd sync --guess-mime-type --delete-removed --add-header="Cache-Control:max-age=600" --add-header='Content-Encoding: gzip' --recursive _site/*.html s3://www.garron.me
s3cmd sync --guess-mime-type --delete-removed --add-header="Cache-Control:max-age=600" --add-header='Content-Encoding: gzip' --recursive _site/*.css s3://www.garron.me
s3cmd sync --guess-mime-type --delete-removed --add-header="Cache-Control:max-age=600" --add-header='Content-Encoding: gzip' --recursive _site/*.js s3://www.garron.me
s3cmd sync --guess-mime-type --delete-removed --add-header="Cache-Control:max-age=600" --recursive _site/*.xml s3://www.garron.me


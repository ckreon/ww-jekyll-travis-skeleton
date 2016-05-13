#!/bin/bash
set -x

if [ $TRAVIS_PULL_REQUEST == false ] ; then

	# Deploy to Production Server if branch is master
	if [ $TRAVIS_BRANCH == $JTS_DBRANCH ] ; then
		# Compress assets with Zopfli (add more directories/files as needed)
		_zopfli/zopfli --i1000 _site/*.xml _site/*.html _site/**/*.html _site/assets/*

		# Start SSH Agent
		eval `ssh-agent -s`
		ssh-add ~/.ssh/$JTS_KEYNAME

		# Initialize a new git repo in _site, and push it to our server.
		cd _site
		git init
		    
		git remote add deploy "deploy@$JTS_SERV_IP:$JTS_SERV_DP"
		git config user.name "Travis CI"
		git config user.email "$JTS_GML_USE+TravisCI@gmail.com"

		git add .
		git commit -m "Deploy"
		git push --force deploy master
		
		else
		echo "Not deploying, branch is not $JTS_DBRANCH."
	fi

fi
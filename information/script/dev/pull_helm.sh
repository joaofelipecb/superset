helm repo add superset https://apache.github.io/superset

rm -R information/helm/repository/superset/superset/
# this workaround is necessary due some bug
# in the version 0.6.0
# (https://github.com/apache/superset/issues/19909)
echo "IMPORTANT: Using a workaround due bug in version 0.6.0 of helm chart of superset"
mkdir -p tmp
git clone https://github.com/apache/superset.git tmp/superset
cd tmp/superset
# using version 5.11.0 instead
git checkout 54c521ba77464c11762c6549b13c0c7902a3bcb2
cd ../..
cp -R tmp/superset/helm/superset/ information/helm/repository/superset/
helm dependency build information/helm/repository/superset/superset/
rm -fR tmp
# after the bug be corrected, delete the workaround
# and uncomment this line
# helm pull superset/superset --untar --untardir information/helm/repository/superset

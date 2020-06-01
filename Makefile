.PHONY: clean rai raip 

clean:
	@echo "Cleaning up build related dirs..."
	@rm -rf build dist plerr.egg-info 2>/dev/null

rai: clean
	@echo "Rebuilding and installing plerr package..."
	@python3 -m pip uninstall -y plerr Pygments
	@python3 setup.py test
	@python3 setup.py install --user

raip: clean
	@echo "Rebuilding and installing plerr package to pipx..."
	@python3 setup.py bdist_wheel
	@pipx uninstall plerr
	@python3 setup.py test
	@pipx install -f dist/*
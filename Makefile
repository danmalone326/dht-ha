install: .venv

.venv: .venv/touchfile

.venv/touchfile: requirements.txt
	test -d .venv || virtualenv .venv
	. .venv/bin/activate; pip install -Ur requirements.txt
	touch .venv/touchfile

clean:
	rm -rf .venv
	find -iname "*.pyc" -delete

rebuildRequirements:
	. .venv/bin/activate; pip freeze > requirements.txt

activate:
	@echo "# Run the following to activate"
	@echo . .venv/bin/activate

deactivate:
	@echo "# Run the following to deactivate"
	@echo deactivate
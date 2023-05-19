# lcp-package-test
[![Butler Publish](https://github.com/msprijatelj/lcp-package-test/actions/workflows/butler-publish.yml/badge.svg)](https://github.com/msprijatelj/lcp-package-test/actions/workflows/butler-publish.yml) [![NPM Publish](https://github.com/msprijatelj/lcp-package-test/actions/workflows/npm-publish.yml/badge.svg)](https://github.com/msprijatelj/lcp-package-test/actions/workflows/npm-publish.yml)

This repository includes several workflows to streamline the deployment of an LCP packages to NPM and Itch.io upon the creation of a GitHub Release. LCPs are data files that can be used with [COMP/CON](https://compcon.app/), the character creation app for the [Lancer RPG](https://massifpress.com/lancer). It additionally includes a manually-triggered workflow that increments the LCP and package versions and creates a matching GitHub tag.

## Secrets Required
Deployment to NPM and Itch.io requires the following GitHub secrets, respectively:
* `NPM_TOKEN`: NPM access token tied to the target NPM account ([documentation here](https://docs.npmjs.com/creating-and-viewing-access-tokens)).
* `BUTLER_CREDENTIALS`: Butler API key tied to the target Itch.io account ([documentation here](https://itch.io/docs/butler/login.html)).

## Variables Required
Deployments to NPM and Itch.io require several preset GitHub variables, either at the org, repository, or environment level.

NPM deployments require the following variables:
* `ACCESS_LEVEL`: Should be either `public` or `restricted`. Used to determine NPM package visibility as per `npm publish --access`.

Itch.io deployments require the following variables:
* `ITCH_GAME`: Itch.io project name. If your project URL is `username.itch.io/project-name`, your project name is `project-name`.
* `ITCH_USER`: Itch.io user name. If your project URL is `username.itch.io/project-name`, your user name is `username`.
* `BUTLER_CHANNEL`: Project channel name for the package. Packages submitted to a project under an existing channel name overwrite the previous package with the same channel name. Options for packages in that channel (like "mark as demo" or "hide this project") are controlled via the project's "Edit" page on Itch.io; they are maintained between deployments. For more information, check the [Butler docs](https://itch.io/docs/butler/pushing.html).

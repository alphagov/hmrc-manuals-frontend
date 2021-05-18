# Manuals Frontend

Front-end app for the manuals format on GOV.UK

## Nomenclature

- **Manuals** – documents published using [Manuals Publisher](https://github.com/alphagov/manuals-publisher).
- **HMRC Manuals** – Manuals published by HMRC and populated via [HMRC Manuals API](https://github.com/alphagov/hmrc-manuals-api).
- **Sections** - individual sub-pages of a Manual or HMRC Manual.

## Live examples

- [Manual: gov.uk/guidance/content-design](https://www.gov.uk/guidance/content-design)
- [Manual Section: gov.uk/guidance/content-design/what-is-content-design](https://www.gov.uk/guidance/content-design/what-is-content-design)
- [HMRC Manual: gov.uk/hmrc-internal-manuals/pensions-tax-manual](https://www.gov.uk/hmrc-internal-manuals/pensions-tax-manual)
- [HMRC Manual Section: gov.uk/hmrc-internal-manuals/pensions-tax-manual/ptm000001](https://www.gov.uk/hmrc-internal-manuals/pensions-tax-manual/ptm000001)

## Installation and running

In a terminal, run:

```
./startup.sh
```

or using bowler:

`bowl manuals-frontend`

If you are using the GDS development virtual machine then the application will be available on the host at http://manuals-frontend.dev.gov.uk/

## Running the tests

The test suite includes testing against govuk-content-schemas, so you will need a copy of this repo on your file system. By default this should be in a sibling directory to your project. Alternatively, you can specify their location with the GOVUK_CONTENT_SCHEMAS_PATH environment variable.

All tests can be run using `bundle exec rake` as well.

## Viewing a manual

You can see the content design manual at http://manuals-frontend.dev.gov.uk/guidance/content-design


## Publishing a manual on dev

Manuals are published using `manuals-publisher` to publish a manual run `manuals-publisher` (instructions here: https://github.com/alphagov/manuals-publisher), publish a manual, and you should then be able to view it on `manuals-frontend`. If you have replicated from preview recently then you should be able to see currently published manuals at http://manuals-frontend.dev.gov.uk/[preview-slug] too.

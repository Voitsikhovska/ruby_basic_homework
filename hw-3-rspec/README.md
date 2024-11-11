[![pipeline status](https://gitlab.com/pivorak-rsc-2019/homeworks/testing/badges/master/pipeline.svg)](https://gitlab.com/pivorak-rsc-2019/homeworks/testing/commits/master)
[![coverage report](https://gitlab.com/pivorak-rsc-2019/homeworks/testing/badges/master/coverage.svg)](https://gitlab.com/pivorak-rsc-2019/homeworks/testing/commits/master)

# Ruby Testing

In this homework we will need to implement tests for Coffee service.

## Requirements:
1. Tests for all methods which need to test
2. Contexts with different available params combination
3. Tests are green !!!

## 6 mandatory ruby elements to use in your implementation
1. describe
2. let
3. subject
4. described_class
5. context
6. it

## BE BARISTA IN YOUR LIFE
The Coffee service has option `barista`
It’s not easy but will make your life better

## Assesment criterias:
**-1**  :  GitlabCI is red or home task was not submitted before 16.06 (Sunday), 11:00 AM (Kyiv time)

**0**   :  GitlabCI is green

**1**   :  GitlabCI is green *and* you used ALL elements from list '6 mandatory ruby elements' (see above) and described all methods (that need to test) and parameters combination

**2**   :  GitlabCI is green *and* you used ALL elements from list '6 mandatory ruby elements' (see above) *and *described all methods (that need to test) and parameters combination and YOU ARE BARISTA

## To run tests locally:

`bundle install`

`bundle exec rspec`

To run rubocop locally:

`rubocop`

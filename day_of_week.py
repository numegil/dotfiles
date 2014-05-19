import time
import random
from datetime import date

MAX_YEARS_BACK = 200

def get_random_date():
  # http://www.wolframalpha.com/input/?i=beta+distribution%2C+alpha%3D1.5%2C+beta%3D5
  random_year = date.today().year - int(MAX_YEARS_BACK * random.betavariate(1.1, 7))

  start_date = date(random_year, 1, 1).toordinal()
  end_date = date(random_year, 12, 31).toordinal()
  return date.fromordinal(random.randint(start_date, end_date))

while True:
  random_date = get_random_date()
  print 'On what day of the week was', random_date.strftime('%b %d, %Y') + '?'
  start_time = time.time()

  weekday_guess = raw_input()
  if weekday_guess == random_date.strftime('%w'):
    time_elapsed = time.time() - start_time
    print 'Yup! That took %.2f seconds' % time_elapsed
    quit()
  else:
    print 'Nope, it was actually a', random_date.strftime('%A')

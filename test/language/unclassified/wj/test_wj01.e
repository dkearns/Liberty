class TEST_WJ01
-- From: Gabriel Weißelberg <gabriel.weisselberg@brokat-le.com>
create {}

feature

  make is
    do
      !!a.make("a");
      !!c;
      if c.output(a) /= Void then end;
    end

  a: AUX_WJ01A1;
  c: AUX_WJ01C1;

end


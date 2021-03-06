vcontext("dotplot")

set.seed(112)
dat <- data.frame(x=rnorm(20), g=LETTERS[1:2])

# Basic dotplot with binning along x axis
ggplot(dat, aes(x)) + geom_dotplot(binwidth=.4)
save_vtest("basic dotplot with dot-density binning, binwidth=.4")

ggplot(dat, aes(x)) + geom_dotplot(binwidth=.4, method="histodot")
save_vtest("histodot binning (equal bin spacing)")

ggplot(dat, aes(x)) + geom_dotplot(binwidth=.4, stackratio=.5, fill="white")
save_vtest("dots stacked closer: stackratio=.5, fill=white")

ggplot(dat, aes(x)) + geom_dotplot(binwidth=.4, dotsize=1.4, fill="white")
save_vtest("larger dots: dotsize=1.5, fill=white")


# Stacking methods
ggplot(dat, aes(x)) + geom_dotplot(binwidth=.4, stackdir="up")
save_vtest("stack up")

ggplot(dat, aes(x)) + geom_dotplot(binwidth=.4, stackdir="down")
save_vtest("stack down")

ggplot(dat, aes(x)) + geom_dotplot(binwidth=.4, stackdir="center")
save_vtest("stack center")

ggplot(dat, aes(x)) + geom_dotplot(binwidth=.4, stackdir="centerwhole")
save_vtest("stack centerwhole")


# Stacking methods with coord_flip
ggplot(dat, aes(x)) + geom_dotplot(binwidth=.4, stackdir="up") + coord_flip()
save_vtest("stack up with coord_flip")

ggplot(dat, aes(x)) + geom_dotplot(binwidth=.4, stackdir="down") + coord_flip()
save_vtest("stack down with coord_flip")

ggplot(dat, aes(x)) + geom_dotplot(binwidth=.4, stackdir="center") + coord_flip()
save_vtest("stack center with coord_flip")

ggplot(dat, aes(x)) + geom_dotplot(binwidth=.4, stackdir="centerwhole") + coord_flip()
save_vtest("stack centerwhole with coord_flip")


# Binning along x, with groups
ggplot(dat, aes(x, fill=g)) + geom_dotplot(binwidth=.4, alpha=.4)
save_vtest("multiple groups, bins not aligned")

ggplot(dat, aes(x, fill=g)) +
  geom_dotplot(binwidth=.4, alpha=.4, binpositions="all")
save_vtest("multiple groups, bins aligned")


# Binning along y axis
ggplot(dat, aes(x=0, y=x)) +
  geom_dotplot(binwidth=.4, binaxis="y", stackdir="center")
save_vtest("bin along y, stack center")

ggplot(dat, aes(x=0, y=x)) +
  geom_dotplot(binwidth=.4, binaxis="y", stackdir="centerwhole")
save_vtest("bin along y, stack centerwhole")

ggplot(dat, aes(x=0, y=x)) +
  geom_dotplot(binwidth=.4, binaxis="y", stackdir="centerwhole", method="histodot")
save_vtest("bin along y, stack centerwhole, histodot")


# Binning along y, with multiple grouping factors
dat2 <- data.frame(x=LETTERS[1:3], y=rnorm(90), g=LETTERS[1:2])

ggplot(dat2, aes(x=x, y=y)) +
  geom_dotplot(binwidth=.25, binaxis="y", stackdir="centerwhole")
save_vtest("bin y, three x groups, stack centerwhole")

ggplot(dat2, aes(x=x, y=y)) +
  geom_dotplot(binwidth=.25, binaxis="y", stackdir="center", binpositions="all") +
save_vtest("bin y, three x groups, bins aligned across groups")

ggplot(dat2, aes(x=x, y=y)) +
  geom_dotplot(binwidth=.25, binaxis="y", stackdir="center", binpositions="all") +
  coord_flip() +
save_vtest("bin y, three x groups, bins aligned, coord_flip")

ggplot(dat2, aes(x="foo", y=y, fill=x)) + scale_y_continuous(breaks=seq(-4,4,.4)) +
  geom_dotplot(binwidth=.25, position="dodge", binaxis="y", stackdir="center")
save_vtest("bin y, dodged")

ggplot(dat2, aes(x="foo", y=y, fill=x)) + scale_y_continuous(breaks=seq(-4,4,.4)) +
  geom_dotplot(binwidth=.25, position="dodge", binaxis="y", stackdir="center") +
  coord_flip()
save_vtest("bin y, dodged, coord_flip")


ggplot(dat2, aes(x=x, y=y, fill=g)) + scale_y_continuous(breaks=seq(-4,4,.4)) +
  geom_dotplot(binwidth=.2, position="dodge", binaxis="y", stackdir="center")
save_vtest("bin y, three x groups, fill and dodge")

ggplot(dat2, aes(x=as.numeric(x), y=y, group=x)) +
  geom_dotplot(binwidth=.2, binaxis="y", stackdir="center")
save_vtest("bin y, continous x-axis, grouping by x")

ggplot(dat2, aes(x=as.numeric(x), y=y)) +
  geom_dotplot(binwidth=.2, binaxis="y", stackdir="center")
save_vtest("bin y, continous x-axis, single x group")


# Stacking groups
ggplot(dat2, aes(x=y, fill=x)) +
  geom_dotplot(binwidth=.25, stackgroups=TRUE, binpositions="all", alpha=0.5)
save_vtest("stackgroups with 3 groups, dot-density with aligned bins")

ggplot(dat2, aes(x=y, fill=x)) +
  geom_dotplot(binwidth=.25, stackgroups=TRUE, method="histodot", alpha=0.5)
save_vtest("stackgroups with 3 groups, histodot")

ggplot(dat2, aes(x=1, y=y, fill=x)) +
  geom_dotplot(binaxis="y", binwidth=.25, stackgroups=TRUE, method="histodot", alpha=0.5)
save_vtest("stackgroups with 3 groups, bin y, histodot")

# This one is currently broken but it would be a really rare case, and it
# probably requires a really ugly hack to fix
ggplot(dat2, aes(x=x, y=y, fill=g)) +
  geom_dotplot(binaxis="y", binwidth=.25, stackgroups=TRUE, method="histodot",
    alpha=0.5, stackdir="centerwhole")
save_vtest("bin y, dodging, stackgroups with 3 groups, histodot (currently broken)")

ggplot(dat2, aes(x=y, fill=g)) +
  geom_dotplot(binwidth=.25, stackgroups=TRUE, method="histodot", alpha=0.5) +
  facet_grid(x ~ .)
save_vtest("facets, 3 groups, histodot, stackgroups")

end_vcontext()
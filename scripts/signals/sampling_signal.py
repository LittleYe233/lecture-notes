from os.path import join

import matplotlib.pyplot as plt
import numpy as np
from matplotlib.ticker import MultipleLocator
from mpl_toolkits.axisartist.axislines import AxesZero

from ..generate_pgf import TEXT_WIDTH, generate_pgf, set_size


FLAT_BLUE = '#4271AB'


def xaxis_formatter(x, _):
    _ = x // np.pi
    if x == 0:
        return ''
    if _ == 1:
        return r'$\pi$'
    elif _ == -1:
        return r'$-\pi$'
    else:
        return r'$%d\pi$' % (x // np.pi)


def handler():
    fig = plt.figure(figsize=set_size(TEXT_WIDTH, 0.48, (1, 1)))
    ax: AxesZero = fig.add_subplot(axes_class=AxesZero)  # type: ignore
    # See:
    # https://matplotlib.org/stable/gallery/axisartist/demo_axisline_style.html
    for direction in ["xzero", "yzero"]:
        ax.axis[direction].set_axisline_style("-|>")
        ax.axis[direction].set_visible(True)
    for direction in ["left", "right", "bottom", "top"]:
        ax.axis[direction].set_visible(False)
    x = np.linspace(-10, 10, 300)
    y = np.sin(x) / x
    ax.plot(x, y, color=FLAT_BLUE, linewidth=0.9)
    ax.xaxis.set_major_locator(MultipleLocator(np.pi))
    ax.xaxis.set_major_formatter(xaxis_formatter)
    ax.text(0.5, 1.05, r'$f(t)$')
    ax.text(11, 0.05, r'$t$')
    return fig


FNAME = 'sampling_signal'

generate_pgf(handler, join('images', FNAME + '.pdf'), backend=None)

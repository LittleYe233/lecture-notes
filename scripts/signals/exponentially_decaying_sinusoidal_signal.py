from os.path import join

import matplotlib.pyplot as plt
import numpy as np
from mpl_toolkits.axisartist.axislines import AxesZero

from ..generate_pgf import TEXT_WIDTH, generate_pgf, set_size


FLAT_BLUE = '#4271AB'


def handler():
    fig = plt.figure(figsize=set_size(TEXT_WIDTH, 0.48, (1, 1)))
    ax: AxesZero = fig.add_subplot(axes_class=AxesZero)  # type: ignore
    for direction in ["xzero", "yzero"]:
        ax.axis[direction].set_axisline_style("-|>")
        ax.axis[direction].set_visible(True)
    for direction in ["left", "right", "bottom", "top"]:
        ax.axis[direction].set_visible(False)
    x = np.linspace(0, 8, 300)
    y = np.exp(-0.3 * x) * np.sin(np.pi * x)
    ax.plot(x, y, color=FLAT_BLUE, linewidth=0.9)
    ax.plot(x, np.exp(-0.3 * x), color='black',
            linewidth=0.3, linestyle='dotted')
    ax.plot(x, -np.exp(-0.3 * x), color='black',
            linewidth=0.3, linestyle='dotted')
    ax.text(0.1, 1.1, r'$f(t)$')
    ax.text(8.3, 0.08, r'$t$')
    return fig


FNAME = 'exponentially_decaying_sinusoidal_signal'

generate_pgf(handler, join('images', FNAME + '.pdf'))

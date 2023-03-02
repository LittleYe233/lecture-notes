# See: https://jwalton.info/Matplotlib-latex-PGF/

import matplotlib.pyplot as plt
from matplotlib.figure import Figure
from typing import Callable, Any


TEXT_WIDTH = 345  # `\showthe\textwidth`


plt.rcParams.update({
    "font.family": "serif",
    "text.usetex": True,
    "pgf.rcfonts": False
})


def set_size(width_pt: float, fraction: float = 1, subplots=(1, 1)):
    """Set figure dimensions to sit nicely in our document.

    Parameters
    ----------
    width_pt: float
            Document width in points
    fraction: float, optional
            Fraction of the width which you wish the figure to occupy
    subplots: array-like, optional
            The number of rows and columns of subplots.
    Returns
    -------
    fig_dim: tuple
            Dimensions of figure in inches
    """

    fig_width_pt = width_pt * fraction
    inches_per_pt = 1 / 72.27
    golden_ratio = (5**.5 - 1) / 2
    fig_width_in = fig_width_pt * inches_per_pt
    fig_height_in = fig_width_in * 0.8 * (subplots[0] / subplots[1])

    return (fig_width_in, fig_height_in)


def generate_pgf(
        handler: Callable[[], Figure],
        fname: str,
        backend: Any = 'pgf',
        *args, **kwargs
):
    fig = handler()
    fig.tight_layout()
    fig.savefig(fname, backend=backend, *args, **kwargs)

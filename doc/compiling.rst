Compile for desktop
===================

Prerequisites
-------------

The only requirement to compile Die Brummbeere is Qt, which you can download
from here:

http://www.qt.io/download/

This will in contain all the Qt libraries and the Qt Creator, which we will
use to compile Die Brummbeere on desktop computers.

Windows, Mac and Linux
----------------------

Note: Playing music won't currently work on Windows, due to a missing
feature in Qt, i.e. streaming audio from password protected URLs. This
is an `open issue in the Qt bugtracker
<https://bugreports.qt.io/browse/QTBUG-45363>`_ and might be solved in future
Qt versions.

On desktop computers Die Brummbeere can be compiled just like any other Qt
software. You may clone the git repository or just download and unzip the
`current master branch
<https://github.com/pbouda/brummbeere/archive/master.zip>`_.
On Mac or Linux just open a shell and type:

.. code-block:: sh

   $ wget https://github.com/pbouda/brummbeere/archive/master.zip
   $ unzip master.zip

This will create a folder named ``brummbeere-master``, which contains a folder
``src`` with the code of Die Brummbeere. Just open the project file
``Brummbeere.pro`` in the Qt Creator and build and run the project.

For manual compilation on the command line you have to call ``qmake`` followed
by ``make`` in the ``src`` folder:

.. code-block:: sh

   $ cd brummbeere-master/src
   $ qmake Brummbeere.pro
   $ make

This will create a binary ``brummbeere`` in the ``mainapp`` folder.

{
	#!/bin/bash
	sed -i "s/ing[ ;.,!?:]/ /g" $1
	sed -i "s/ed[ ;.,!?:]/ /g" $1
	sed -i "s/s[ ;.,!?:]/ /g" $1
}

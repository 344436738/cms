package com.leimingtech.cms.tag.macrotag;

import java.io.IOException;
import java.io.Writer;

import org.springframework.stereotype.Component;

import com.leimingtech.cms.tag.base.BaseDirective;
import com.leimingtech.cms.tag.base.DirectiveHandler;

import freemarker.template.TemplateException;
import freemarker.template.TemplateModelException;

/**
 * 标签中内容转为大写
 * 
 * @author liuzhen
 * 
 */
@Component
public class UpperTag extends BaseDirective {

	@Override
	public void execute(DirectiveHandler handler) throws TemplateException,
			IOException {
		// 检查参数是否传入
		if (!handler.getParameters().isEmpty()) {
			throw new TemplateModelException(
					"This directive doesn't allow parameters.");
		}
		if (handler.getLoopVars().length != 0) {
			throw new TemplateModelException(
					"This directive doesn't allow loop variables.");
		}
		// 是否有非空的嵌入内容
		if (handler.getTemplateDirectiveBody() != null) {
			// 执行嵌入体部分，和FTL中的<#nested>一样，除了
			// 我们使用我们自己的writer来代替当前的output writer.
			handler.getTemplateDirectiveBody()
					.render(new UpperCaseFilterWriter(handler.getEnvironment()
							.getOut()));
		} else {
			throw new RuntimeException("missing body");
		}
	}

}

class UpperCaseFilterWriter extends Writer {

	private final Writer out;

	public UpperCaseFilterWriter(Writer out) {
		this.out = out;
	}

	@Override
	public void write(char[] cbuf, int off, int len) throws IOException {
		char[] transformedCbuf = new char[len];
		for (int i = 0; i < len; i++) {
			transformedCbuf[i] = Character.toUpperCase(cbuf[i + off]);
		}
		out.write(transformedCbuf);
	}

	@Override
	public void flush() throws IOException {
		out.flush();
	}

	@Override
	public void close() throws IOException {
		out.close();

	}

}